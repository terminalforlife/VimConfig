Documentation for the 'moredoc' Plugin by TFL                        2021-08-02
-------------------------------------------------------------------------------

Description

    This is a very simple plugin which probably won't play nicely with various
    other common plugins people download these days.

    The point of `moredoc` is to allow the user to easily toggle between
    More mode and Document mode, for code and a regular plain text document, -
    respectively. Think of these 'modes' as a set of presets I consider
    appropriate to use for each task.

    - More Mode

        This mode will toggle the following settings:

                   ruler / noruler
                  number / nonumber
               showmatch / noshowmatch
            laststatus=1 / laststatus=2

    - Document Mode

        This mode will toggle the following settings:

                    wrap / nowrap
               linebreak / nolinebreak
               syntax on / syntax off

    The modes can be combined.

Variables

    Where `*` in the variable name is `g:MoreDoc_`.

    *Animate = [1|2]                  - Enable (1) or disable (0) the goofy
                                        animation you see when enabling and
                                        disabling More Mode. It's enabled by
                                        default.
