Documentation for the 'codedoc' Plugin by TFL                        2022-04-25
-------------------------------------------------------------------------------

Description

    This is a very simple plugin which probably won't play nicely with various
    other common plugins people download these days, and is not designed at all
    for plugin managers.

    The point of CodeDoc is to allow the user to easily toggle between
    Code mode and Document mode, for code and a regular plain text document, -
    respectively. Think of these 'modes' as a set of presets I consider
    appropriate to use for each task.

    - Code Mode

        This mode will toggle the following settings:

                   ruler / noruler
                  number / nonumber
               showmatch / noshowmatch
          colorcolumn=80 / colorcolumn=0

    - Document Mode

        This mode will toggle the following settings:

                    wrap / nowrap
               linebreak / nolinebreak
               syntax on / syntax off

    The modes can be combined.
