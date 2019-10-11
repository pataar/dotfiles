<?php

$finder = PhpCsFixer\Finder::create()
	->in([__DIR__ . "/app"]);

return PhpCsFixer\Config::create()
	->setRules([
		'@PSR2' => true,
		'align_multiline_comment' => ["comment_type" => "all_multiline"],
		'array_indentation' => true,
		'array_syntax' => ['syntax' => 'short'],
		'binary_operator_spaces' => true,
		'braces' => ['position_after_functions_and_oop_constructs' => "same", 'allow_single_line_closure' => true],
		'class_attributes_separation' => ["elements" => ['method']],
		'combine_consecutive_issets' => true,
		'combine_consecutive_unsets' => true,
		'concat_space' => ['spacing' => 'one'],
		'declare_equal_normalize' => ['space' => 'single'],
		'fully_qualified_strict_types' => true,
		'function_declaration' => ['closure_function_spacing' => "none"],
		'include' => true,
		'indentation_type' => true,
		'multiline_whitespace_before_semicolons' => ['strategy' => 'no_multi_line'],
		'no_alternative_syntax' => true,
		'no_blank_lines_after_phpdoc' => true,
		'no_empty_comment' => true,
		'no_empty_phpdoc' => true,
		'no_empty_statement' => true,
		'no_singleline_whitespace_before_semicolons' => true,
		'no_spaces_around_offset' => true,
		'no_spaces_inside_parenthesis' => true,
		'no_trailing_comma_in_singleline_array' => true,
		'no_unused_imports' => true,
		'no_useless_else' => true,
		'no_whitespace_in_blank_line' => true,
		'object_operator_without_whitespace' => true,
		'ordered_imports' => true,
		'phpdoc_order' => true,
		'phpdoc_single_line_var_spacing' => true,
		'phpdoc_types' => true,
		'phpdoc_types_order' => true,
		'phpdoc_var_annotation_correct_order' => true,
		'return_assignment' => true,
		'single_blank_line_before_namespace' => true,
		'single_class_element_per_statement' => true,
		'single_line_after_imports' => true,
		'ternary_operator_spaces' => true,
		'trim_array_spaces' => true,
		'unary_operator_spaces' => true,
		'whitespace_after_comma_in_array' => true,
	])
	->setIndent("\t")
	->setCacheFile(".dev/phpcs_cache")
	->setLineEnding("\n")
	->setFinder($finder);
