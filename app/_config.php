<?php

use SilverStripe\i18n\i18n;
use SilverStripe\Core\Environment;
use SilverStripe\Control\Email\Email;
use SilverStripe\Core\Manifest\ModuleLoader;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;

use SilverStripe\Core\Manifest\ModuleResourceLoader;

Email::config()->set('admin_email', Environment::getEnv('SS_ADMIN_EMAIL'));

// Set the site locale
i18n::set_locale('de_CH');

// TinyMCE Config
$styles = [
    [
        // https://github.com/tinymce/tinymce/issues/9186
        'title' => 'Format',
        'selector' => '*'
    ],
    [
        // Wrap selected content in a div with class of .split-2
        'title' => '2 Spalten (auto-flow)',
        'attributes' => ['class' => 'split-2'],
        'block' => 'div',
        'wrapper' => 1
    ],
    [
        // Wrap selected content in a div with class of .boxed
        'title' => 'Box',
        'attributes' => ['class' => 'boxed'],
        'block' => 'div',
        'wrapper' => 1
    ],
    [
        // add .download to a a
        'title' => 'Download-Link',
        'attributes' => ['class' => 'download'],
        'selector' => 'a'
    ],
    [
        // add .forth to a a
        'title' => 'Arrow-Link',
        'attributes' => ['class' => 'forth'],
        'selector' => 'a'
    ],
    [
        // add .back to a a
        'title' => 'Arrow-Back',
        'attributes' => ['class' => 'back'],
        'selector' => 'a'
    ],
    [
        // add .button to a a
        'title' => 'Button-Link',
        'attributes' => ['class' => 'button'],
        'selector' => 'a'
    ],
    [
        // Wrap selected content in a div with class of .small
        'title' => 'small',
        'attributes' => ['class' => 'small'],
        'block' => 'div',
        'wrapper' => 1
    ],
    [
        // Wrap selected content in a div with class of .large
        'title' => 'large',
        'attributes' => ['class' => 'large'],
        'block' => 'div',
        'wrapper' => 1
    ],
    [
        // add .inline - no margin-bottom
        'title' => 'no bottom-margin',
        'attributes' => ['class' => 'inline'],
        'selector' => 'p,h1,h2,h3'
    ],
    [
        // add .halveinline - halve-line margin-bottom
        'title' => '½ bottom-margin',
        'attributes' => ['class' => 'halveinline'],
        'selector' => 'p,h1,h2,h3'
    ]
];

// Common plugins for all editor variants
$adminModule = ModuleLoader::inst()->getManifest()->getModule('silverstripe/admin');
$tinyMceCommonPlugins = [
    'image' => null,
    'anchor' => null,
    'sslink' => $adminModule->getResource('client/dist/js/TinyMCE_sslink.js'),
    'sslinkexternal' => $adminModule->getResource('client/dist/js/TinyMCE_sslink-external.js'),
    'sslinkemail' => $adminModule->getResource('client/dist/js/TinyMCE_sslink-email.js'),
    'emoticons',
    'charmap',
    'deflist' => ModuleResourceLoader::resourceURL('app/thirdparty/tinyMCE-DefinitionList-main/deflist/plugin.min.js')
];

// Common options for all editor variants
$tinyMceCommonOptions = [
    'style_formats' => $styles,
    'block_formats' => 'Paragraph=p;Heading 1=h1;Heading 2=h2;Heading 3=h3; Heading 4=h4',
    'paste_remove_spans' => true,
    'paste_as_text' => true,
    'paste_text_sticky_default' => true,
    'paste_text_sticky' => true,
    'statusbar' => true,
    'contextmenu' => "searchreplace | sslink anchor ssmedia ssembed"
];

// -----------------------------------------------------------------------------
// Full CMS Editor Configuration
// -----------------------------------------------------------------------------
$EditorConfig = TinyMCEConfig::get('cms');
$EditorConfig->enablePlugins($tinyMceCommonPlugins);
$EditorConfig->disablePlugins(['importcss']);
$EditorConfig->setOptions($tinyMceCommonOptions);

// Full editor toolbar with all features
$EditorConfig->setButtonsForLine(1, [
    'blocks styles pastetext ssmedia ssembed | bold align | bullist numlist deflist | outdent indent | sslink anchor | emoticons charmap blockquote hr code removeformat visualblocks | undo redo'
]);
$EditorConfig->setButtonsForLine(2, '');
$EditorConfig->setOption(
    'extended_valid_elements',
    'span[data-feather]'
    // 'div[*]'
);
