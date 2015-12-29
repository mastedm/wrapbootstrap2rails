# Wrapbootstrap2rails
Correct copy WrapBootstrap template to Rails project


## Usage
### Run 
`./wrapbootstrap2rails.rb NAME TEMPLATE_ASSETS_FOLDER RAILS_VENDOR_ASSETS_FOLDER`

Example

`./wrapbootstrap2rails.rb abc ~/Themes/abc/admin/template_content_html/assets ~/workspace_rails/project/vendor/assets`

### For template specific css/js

```
/**
 *= require NAME/file
 */

//= require NAME/file
```


### For plugins

```
/**
 *= require plugins/NAME/file
 */

//= require plugins/NAME/file
```
