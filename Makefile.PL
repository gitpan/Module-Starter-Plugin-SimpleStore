use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Module::Starter::Plugin::DirStore',
		DISTNAME            => 'Module-Starter-Plugin-SimpleStore',
    AUTHOR              => 'Ricardo SIGNES <rjbs@cpan.org>',
    VERSION_FROM        => 'lib/Module/Starter/Plugin/DirStore.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'      => 0,
				'Module::Starter' => 1.25_01
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Module-Starter-Plugin-SimpleStore-*' },
);
