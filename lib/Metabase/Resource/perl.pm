use 5.006;
use strict;
use warnings;
package Metabase::Resource::perl;
# VERSION

use Carp ();

use Metabase::Resource;
our @ISA = qw/Metabase::Resource/;

sub _extract_type {
  my ($self, $resource) = @_;

  # determine type
  # Possible types could be:
  #  - commit
  #  - tag -- not implemented
  #  - tarball -- not implemented
  my ($type) = $resource =~ m{\Aperl:///([^/]+)/};
  Carp::confess("could not determine Metabase::Resource type from '$resource'\n")
    unless defined $type && length $type;
  return __PACKAGE__ . "::$type";
}

1;

# ABSTRACT: class for Metabase resources under the perl scheme

=pod

=head1 SYNOPSIS

  my $resource = Metabase::Resource->new(
    'perl:///commit/8c576062',
  );

  my $resource_meta = $resource->metadata;
  my $typemap       = $resource->metadata_types;

=head1 DESCRIPTION

Generates resource metadata for resources of the scheme 'perl'.

The L<Metabase::Resource::perl> class supports the followng sub-type(s).

=head2 commit

  my $resource = Metabase::Resource->new(
    'perl:///commit/8c576062',
  );

For the example above, the resource metadata structure would contain the
following elements:

  scheme       => perl
  type         => commit
  sha1         => 8c576062

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.
Bugs can be submitted through the web interface at
L<http://rt.cpan.org/Dist/Display.html?Queue=Metabase-Fact>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=cut

