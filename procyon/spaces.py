import numpy as np


class RGB:
    def __init__(self, r: float, g: float, b: float):
        self.array = np.array([r, g, b])

    def __repr__(self):
        return f"RGB{(*self.array,)}"

    def __new__(cls, r: float, g: float, b: float, *args, **kwargs):
        if np.any(np.array([r, g, b]) < 0) or np.any(np.array([r, g, b]) > 1):
            raise ValueError("RGB values must be in range [0, 1].")
        return super().__new__(cls, *args, **kwargs)

    @property
    def hex(self) -> str:
        return '#' + ''.join(map(lambda x: hex(round(x * 255))[2:].zfill(2), self.array))

    @property
    def xyz(self) -> 'XYZ':
        return XYZ.from_rgb(self)

    @classmethod
    def from_xyz(cls, xyz: 'XYZ') -> 'RGB':
        m = np.array([
            [3.2404542, -1.5371385, -0.4985314],
            [-0.9692660, 1.8760108, 0.0415560],
            [0.0556434, -0.2040259, 1.0572252]
        ])
        return cls(*np.dot(m, xyz.array)).gamma_compress()

    def gamma_expand(self) -> 'RGB':
        def _gamma_expand(c: float) -> float:
            if c <= 0.04045:
                return c / 12.92
            else:
                return ((c + 0.055) / 1.055) ** 2.4

        self.array = np.array([*map(_gamma_expand, self.array)])
        return self

    def gamma_compress(self) -> 'RGB':
        def _gamma_compress(c: float) -> float:
            if c <= 0.0031308:
                return c * 12.92
            else:
                return 1.055 * (c ** (1 / 2.4)) - 0.055

        self.array = np.array([*map(_gamma_compress, self.array)])
        return self


class XYZ:
    def __init__(self, x: float, y: float, z: float):
        self.array = np.array([x, y, z])

    def __repr__(self):
        return f"XYZ{(*self.array,)}"

    def __new__(cls, x: float, y: float, z: float, *args, **kwargs):
        if np.any(np.array([x, y, z]) < 0):
            raise ValueError("XYZ values must be non-negative.")
        return super().__new__(cls, *args, **kwargs)

    @property
    def rgb(self) -> RGB:
        return RGB.from_xyz(self)

    @property
    def lab(self) -> 'Lab':
        return Lab.from_xyz(self)

    @classmethod
    def from_rgb(cls, rgb: RGB) -> 'XYZ':
        m = np.array([
            [0.4124564, 0.3575761, 0.1804375],
            [0.2126729, 0.7151522, 0.0721750],
            [0.0193339, 0.1191920, 0.9503041]
        ])
        return cls(*np.dot(m, rgb.gamma_expand().array))

    @classmethod
    def from_lab(cls, lab: 'Lab') -> 'XYZ':
        l, a, b = lab.array
        f_y = ((l + 16) / 116)
        f_x = a / 500 + f_y
        f_z = f_y - b / 200
        x, y, z = map(cls.f, [f_x, f_y, f_z])
        return cls(x * X, y * Y, z * Z)

    @staticmethod
    def f(t: float) -> float:
        return t ** 3 if t > 6 / 29 else 3 * (6 / 29) ** 2 * (t - 4 / 29)


class Lab:
    def __init__(self, l: float, a: float, b: float):
        self.array = np.array([l, a, b])

    def __repr__(self):
        return f"Lab{(*self.array,)}"

    def __new__(cls, l: float, a: float, b: float, *args, **kwargs):
        if not 0 <= l <= 100:
            raise ValueError("L* must be in range [0, 100].")
        return super().__new__(cls, *args, **kwargs)

    @property
    def xyz(self) -> XYZ:
        return XYZ.from_lab(self)

    @property
    def lch(self) -> 'LCh':
        return LCh.from_lab(self)

    @classmethod
    def from_xyz(cls, xyz: XYZ) -> 'Lab':
        x, y, z = xyz.array
        f_x, f_y, f_z = map(cls.f, [x / X, y / Y, z / Z])
        l = 116 * f_y - 16
        a = 500 * (f_x - f_y)
        b = 200 * (f_y - f_z)
        return Lab(l, a, b)

    @classmethod
    def from_lch(cls, lch: 'LCh') -> 'Lab':
        l, c, h = lch.array
        return cls(l, c * np.cos(np.radians(h)), c * np.sin(np.radians(h)))

    @staticmethod
    def f(t: float) -> float:
        return t ** (1 / 3) if t > (6 / 29) ** 3 else t / (29 / 3) ** 2 / 3 + 4 / 29


class LCh:
    def __init__(self, l: float, c: float, h: float):
        self.array = np.array([l, c, h])

    def __repr__(self):
        return f"LCh{(*self.array,)}"

    def __new__(cls, l: float, c: float, h: float, *args, **kwargs):
        if not 0 <= l <= 100:
            raise ValueError("L* must be in range [0, 100].")
        if c < 0:
            raise ValueError("C must be non-negative.")
        if h < 0:
            while h < 0:
                h += 360
        elif h > 360:
            while h > 360:
                h -= 360
        return super().__new__(cls, *args, **kwargs)

    @property
    def lab(self) -> Lab:
        return Lab.from_lch(self)

    @classmethod
    def from_lab(cls, lab: Lab) -> 'LCh':
        l, a, b = lab.array
        return cls(l, np.sqrt(a ** 2 + b ** 2), np.degrees(np.arctan2(b, a)))


X, Y, Z = 0.95047, 1.00000, 1.08883
