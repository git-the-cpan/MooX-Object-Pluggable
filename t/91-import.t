use Modern::Perl;
use Test::More;
use Moops;
role A::Hello { method hello { "Hello" } }
# with '-'
class A1 { use MooX::Object::Pluggable -pluggable_options => { search_path => ["A"] }, -load_plugins => ["Hello"]; }
# without '-'
class B2 { use MooX::Object::Pluggable pluggable_options => { search_path => ["A"] }, load_plugins => ["Hello"]; }
# MooX compatible
class C3 { use MooX 'Object::Pluggable' => { -pluggable_options => { search_path => ["A"] }, -load_plugins => ['Hello'] }; }

can_ok('A1', "load_plugin", "load_plugins", "loaded_plugins", "plugins");

can_ok('A1'->new, "hello");
can_ok('B2'->new, 'hello');
can_ok('C3'->new, 'hello');

done_testing;
