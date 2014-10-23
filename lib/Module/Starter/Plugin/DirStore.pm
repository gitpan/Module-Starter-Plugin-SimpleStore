package Module::Starter::Plugin::DirStore;

our $VERSION = '0.01_03';

use warnings;
use strict;

use File::Basename;

=head1 NAME

Module::Starter::Plugin::DirStore -- module template files in a directory

=head1 SYNOPSIS

 use Module::Starter qw(
   Module::Starter::Simple
   Module::Starter::Plugin::Template
   Module::Starter::Plugin::DirStore
   ...
 );

 Module::Starter->create_distro( ... );

=head1 DESCRIPTION

This Module::Starter plugin is intended to be loaded after
Module::Starter::Plugin::Template.  It implements the C<templates> method,
required by the Template plugin.  The C<DirStore> plugin stores all the
required templates as files in a directory.

=cut

=head1 METHODS

=head2 C<< templates >>

This method reads in the template files and populates the object's C<templates>
attribute.  For now, the module template directory is found by checking the
MODULE_TEMPLATE_DIR environment variable.

=cut

sub templates {
    my $self = shift;
    my %template;

    my $template_dir = $ENV{MODULE_TEMPLATE_DIR}
        or die "template dir not defined";
    die "template dir does not exist: $template_dir"
        unless -d $template_dir;

    foreach (<$template_dir/*>) {
				my $basename = basename $_;
        next if (not -f $_) or ($basename =~ /^\./);
        open my $template_file, '<', $_ or die "couldn't open template: $_";
        local $/;
        $template{$basename} = <$template_file>;
        close $template_file;
    }

    return %template;
}

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 Bugs

Please report any bugs or feature requests to
C<bug-module-starter-plugin-inlinestore@rt.cpan.org>, or through the web
interface at L<http://rt.cpan.org>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2004 Ricardo SIGNES, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
