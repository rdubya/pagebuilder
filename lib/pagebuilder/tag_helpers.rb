# Helper module to make building pages easier
module PageBuilder::TagHelpers

  # Helper for converting this object to html
  # It passes arguments along to whatever is set as the
  # pagebuilder document so see associated documentation for the
  # allowed arguments
  def to_html(*args)
    pagebuilder_document.to_html(*args)
  end

end

# Actual helper implementations are split into several files
# to help with organization
require 'pagebuilder/tag_helpers/embeds'
require 'pagebuilder/tag_helpers/forms'
require 'pagebuilder/tag_helpers/lists'
require 'pagebuilder/tag_helpers/miscellaneous'
require 'pagebuilder/tag_helpers/page_structure'
require 'pagebuilder/tag_helpers/pagebuilder_prefixed_helpers'
require 'pagebuilder/tag_helpers/tables'
require 'pagebuilder/tag_helpers/text_markup'
