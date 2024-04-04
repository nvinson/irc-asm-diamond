project('irc-diamond', 'nasm', 'c')

diamond = library('diamond', 'diamond.asm')

irc_diamond = executable('irc-diamond', 'main.asm', link_with: [diamond])

test('irc-diamond-test',
     executable('irc-diamond-tests',
                'test.c',
                link_with: [diamond])
    )
