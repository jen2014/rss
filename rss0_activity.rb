require 'ruboto/widget'
require 'ruboto/util/toast'
require 'rss'
ruboto_import_widgets :Button, :LinearLayout, :TextView, :ListView

$subjects = []
url = 'http://www.gypsyrumor.com/podcast/podcast.xml'
#
# Collect list of items from RSS xml
# ----------------------------------
rss = RSS::Parser.parse(url)
rss.items.each do |item|	
	subject = item.title.to_s
	$subjects << subject
end
#
# Display list of items
# ---------------------
class Rss0Activity
	def onCreate(bundle)
    super
    set_title 'Download rss topics'
    self.content_view =
        linear_layout :orientation => :vertical do
          @list_view = list_view :list => []
        end
  end
	def onResume
    super
    @list_view.adapter.add_all $subjects
  end
end
