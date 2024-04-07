project('irc-diamond', 'nasm', 'c')

diamond = library('diamond', 'diamond.asm')

executable('irc-diamond',
           'main.asm',
           link_with: [diamond],
           link_args: ['-nostdlib', '-nostartfiles']
          )

test('irc-diamond-test',
     executable('irc-diamond-tests',
                'test.c',
                link_with: [diamond])
    )
