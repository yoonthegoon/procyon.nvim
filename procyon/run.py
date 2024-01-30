from spaces import LCh, RGB, XYZ


def force_gamut(y: float, c: float, h: float, precision: float = 0.001) -> RGB | None:
    while True:
        try:
            xyz = XYZ(0, y, 0)
        except ValueError:
            return
        try:
            l = xyz.lab.array[0]
            lch = LCh(l, c, h)
        except ValueError:
            return
        try:
            rgb = lch.lab.xyz.rgb
        except ValueError:
            c -= precision
            continue
        return rgb


def get_luminance(base: float, contrast_ratio: float) -> float:
    if -1 < contrast_ratio <= 0:
        raise ValueError("Contrast ratio must be greater than 0.")
    if contrast_ratio > 0:
        return (base + 0.05) * contrast_ratio - 0.05
    return (base + 0.05) / -contrast_ratio - 0.05


def get_luminances(mode: str = 'dark') -> dict[str, float]:
    base = (1.05 * 0.05) ** (1 / 2) - 0.05
    black = get_luminance(base, -3)
    white = get_luminance(base, 3)
    if mode == 'dark':
        dark_black = black
        black = get_luminance(dark_black, 1.5)
        dark = base
        normal = get_luminance(dark, 1.5)
        bright = get_luminance(normal, 1.5)
        white = get_luminance(base, 3)
        bright_white = get_luminance(white, 1.5)
    else:
        bright_white = white
        white = get_luminance(bright_white, -1.5)
        bright = base
        normal = get_luminance(bright, -1.5)
        dark = get_luminance(normal, -1.5)
        black = get_luminance(base, -3)
        dark_black = get_luminance(black, -1.5)
    return {
        'dark_black': dark_black,
        'black': black,
        'dark': dark,
        'normal': normal,
        'bright': bright,
        'white': white,
        'bright_white': bright_white,
    }


def main(mode: str = 'dark', flavor: str = 'purple', grayscale_chroma: float = 15, color_chroma: float = 60):
    luminances = get_luminances(mode)
    hues = {
        'red': 0,
        'orange': 45,
        'yellow': 90,
        'green': 180,
        'blue': 270,
        'purple': 315,
    }
    grayscale = {
        'dark_black':   force_gamut(luminances['dark_black'],   grayscale_chroma, hues[flavor]),
        'black':        force_gamut(luminances['black'],        grayscale_chroma, hues[flavor]),
        'dark_gray':    force_gamut(luminances['dark'],         grayscale_chroma, hues[flavor]),
        'gray':         force_gamut(luminances['normal'],       grayscale_chroma, hues[flavor]),
        'light_gray':   force_gamut(luminances['bright'],       grayscale_chroma, hues[flavor]),
        'white':        force_gamut(luminances['white'],        grayscale_chroma, hues[flavor]),
        'bright_white': force_gamut(luminances['bright_white'], grayscale_chroma, hues[flavor]),
    }
    for name, color in grayscale.items():
        print(f'{name: <16}= "{color.hex}"')
    for luminance, y in {'dark_': luminances['dark'], '': luminances['normal'], 'bright_': luminances['bright']}.items():
        for name, hue in hues.items():
            color = force_gamut(y, color_chroma, hue)
            print(f'{luminance}{name: <8}= "{color.hex}"')


if __name__ == '__main__':
    main(
        mode='light',
        flavor='orange',
    )
