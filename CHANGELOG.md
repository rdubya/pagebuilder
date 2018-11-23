## v0.3.0
### Changed
* Made it so that the body and head tags on a PageBuilder::Document are PageBuilder::Elements::Basic objects

## v0.2.0
### Added
* :>> as an alias of Node#append_child to allow for cleaner nesting
* helpers for setting the base uri for a document
* helpers to the document for managing a list of javascript files to be
output at the end of the body
### Changed
* Removed the `content` argument from tag helpers for tags that shouldn't have text content
* Added better documentation of the available tags
### Removed
* #menu_item since the tag is essentially dead

## v0.1.0
Initial release
