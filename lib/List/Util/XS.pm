package List::Util::XS;
use strict;
use warnings;

our $VERSION = "1.45";       # FIXUP
our $XS_VERSION = $VERSION;
$VERSION = eval $VERSION;    # FIXUP

require Exporter;

our @ISA        = qw(Exporter);
our @EXPORT_OK  = qw(
  all any first min max minstr maxstr none notall product reduce sum sum0 shuffle uniq uniqnum uniqstr
  pairs unpairs pairkeys pairvalues pairmap pairgrep pairfirst
);

require XSLoader;
XSLoader::load(__PACKAGE__, $XS_VERSION);

sub List::Util::XS::_Pair::key   { $_[0][0] }
sub List::Util::XS::_Pair::value { $_[0][1] }

sub import
{
  my $pkg = caller;

  # (RT88848) Touch the caller's $a and $b, to avoid the warning of
  #   Name "main::a" used only once: possible typo" warning
  no strict 'refs';
  ${"${pkg}::a"} = ${"${pkg}::a"};
  ${"${pkg}::b"} = ${"${pkg}::b"};

  goto &Exporter::import;
}


1;
__END__

=head1 NAME

List::Util::XS - Indicate if List::Util was compiled with a C compiler

=head1 SYNOPSIS

    use List::Util::XS 1.20;

=head1 DESCRIPTION

C<List::Util::XS> can be used as a dependency to ensure List::Util was
installed using a C compiler and that the XS version is installed.

During installation C<$List::Util::XS::VERSION> will be set to
C<undef> if the XS was not compiled.

Starting with release 1.23_03, Scalar-List-Util is B<always> using
the XS implementation, but for backwards compatibility, we still
ship the C<List::Util::XS> module which just loads C<List::Util>.

=head1 SEE ALSO

L<Scalar::Util>, L<List::Util>, L<List::MoreUtils>

=head1 COPYRIGHT

Copyright (c) 2008 Graham Barr <gbarr@pobox.com>. All rights reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
