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

List::Util::XS - Accelerated implementation of L<List::Util> subs

=head1 SYNOPSIS

    use List::Util::XS 1.46;

=head1 DESCRIPTION

C<List::Util::XS> contains XS accelerated implementations of the L<List::Util>
subroutines.  It can be used as a dependency to ensure that these faster
versions of the subs are available.  This requires a C compiler.

Using L<List::Util> should be preferred for most code, as it will automatically
use this module when possible to provide the faster implementations.

=head1 SEE ALSO

L<Scalar::Util>, L<List::Util>

=head1 COPYRIGHT

Copyright (c) 2008 Graham Barr <gbarr@pobox.com>. All rights reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
