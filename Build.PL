use strict;
use warnings;

use Module::Build;
use ExtUtils::CChecker;

ExtUtils::CChecker->new->assert_compile_run( 
   diag => "no lchown()",
   source => <<'EOF' );
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char *argv[]) {
  if(lchown(".", -1, -1) != 0)
    exit(1);
  exit(0);
}
EOF

my $build = Module::Build->new(
   module_name => 'File::lchown',
   configure_requires => {
      'ExtUtils::CChecker' => 0,
   },
   requires => {
   },
   build_requires => {
      'Module::Build' => 0,
      'Module::Build::Compat' => 0,
      'Test::More' => 0,
   },
   license => 'perl',
   create_makefile_pl => 'small',
   create_license => 1,
   create_readme  => 1,
);
  
$build->create_build_script;
