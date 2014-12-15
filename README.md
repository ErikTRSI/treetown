Tree Town
===

My daughter's pre-school [website](http://www.treetown-coop.org) is a bit dated looking and could use some sprucing up.

Some notes about the models involved:

Content Hierarchy
===

```
Category
|
|-Page
```

The navbar menu is generated based on the above hierarchy. A `Page` *must* belong to a `Category`. If a `Category` has more than one page underneath it, the `Category` name will be displayed as a dropdown menu item on the navbar, with each `Page` has a selectable item on the menu. If a `Category` has only one `Page` element beneath it, that one item will be the root item for that `Category` and the `Category`'s name will not be displayed. `Page` titles must be unique, as their slug values are derived from the title property, and are generated at save-time and used as a lookup value.

If a `Page` object has a title of "Home" or "home," it is considered to be the site's homepage. The proper capitalization "Home" is preferred, as it will be displayed on the navbar using what is literally in the database.

A `Page` object may have a single image associated with it. This is achieved through the `image` property, which is powered by the [Paperclip](https://github.com/thoughtbot/paperclip) gem.

A `Page` object can be marked as `feature?` and have its blurb and image presented on the homepage. Only three features will be visible on the homepage, and the top three pages marked as `feature? == true` will be visible. The featured pages are sorted by most recently modified.
