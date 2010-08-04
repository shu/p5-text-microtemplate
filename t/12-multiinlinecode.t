use strict;
use warnings;
use Test::More tests => 2;
use Text::MicroTemplate ':all';

is render_mt(<<'...')->as_string, "abc\nok\ndef\n", "multi inline-code in 1 line";
abc
<? if (1) { ?>ok<? } ?>
def
...

is render_mt(<<'...')->as_string, "abc\n1 2\ndef\n", "multi inline-expr in 1 line";
abc
? $a = 0
<?= ++$a ?> <?= ++$a ?>
def
...
