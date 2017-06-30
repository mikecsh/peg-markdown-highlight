Pod::Spec.new do |s|
  s.name         = 'PegMarkdownHighlight'
  s.homepage     = 'http://hasseg.org/peg-markdown-highlight/'
  s.version      = '0.1.0'
  s.license      = { :file => 'LICENSE' }
  s.summary      = 'This is a syntax highlighter for the Markdown language, designed to be integrated into GUI text editor programs. It uses a recursive-descent parser for interpreting the input (instead of e.g. regular expressions), and this parser is based on the PEG grammar from John MacFarlane\'s peg-markdown project.'
  s.authors      = { 'Ali Rantakari' => '@ali-rantakari' }
  s.source       = { :git => 'https://github.com/ali-rantakari/peg-markdown-highlight.git' }

  s.prepare_command = <<-CMD
    CC=gcc make -C ./greg
    ./greg/greg -o pmh_parser_core.c pmh_grammar.leg
    ./tools/combine_parser_files.sh > pmh_parser.c
  CMD

  s.source_files = 'pmh_parser.{h,c}', 'pmh_styleparser.{h,c}', 'pmh_definitions.h', 'example_cocoa/HGMarkdownHighlighter.{h,m}', 'example_cocoa/HGMarkdownHighlightingStyle.{h,m}'
  s.public_header_files = 'pmh_parser.h', 'pmh_styleparser.h', 'pmh_definitions.h', 'example_cocoa/HGMarkdownHighlighter.h', 'example_cocoa/HGMarkdownHighlightingStyle.h'
  s.exclude_files = 'example_gtk2', 'example_qt', 'styles', 'doxygen', 'Makefile', 'ANSIEscapeHelper.*', 'bench.h', 'highlighter.c', '*.md', 'test*'

  s.osx.deployment_target = '10.7'
end
