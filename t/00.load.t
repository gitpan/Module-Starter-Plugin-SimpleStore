use Test::More tests => 2;

BEGIN {
use_ok( 'Module::Starter::Plugin::DirStore' );
use_ok( 'Module::Starter::Plugin::InlineStore' );
}

diag( "Testing Module::Starter::Plugin::DirStore $Module::Starter::Plugin::DirStore::VERSION" );
