const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */


const PUBLIC_JS = 'public/js/';
const PUBLIC_CSS = 'public/css/';

const RESOURCE_JS = 'resources/js/';
const RESOURCE_SASS = 'resources/sass/';

let aInquiryListJs = [
    'resources/js/app.js'
];

// Compile default scripts and style
mix
    .js(aInquiryListJs, PUBLIC_JS + 'app.js')
    .vue()
    .sass(RESOURCE_SASS + 'app.scss', PUBLIC_CSS);



//
// mix.js(aInquiryListJs, 'public/js/inquiry-list.js');
//
// mix.js('resources/js/app.js', 'public/js')
//     .vue()
//     .sass('resources/sass/app.scss', 'public/css');
