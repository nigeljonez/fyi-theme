# The PublicBodyCategories structure works like this:
# [
#   "Main category name",
#       [ "tag_to_use_as_category", "Sub category title", "sentence that can describes things in this subcategory" ],
#       [ "another_tag", "Second sub category title", "another descriptive sentence for things in this subcategory"],
#   "Another main category name",
#       [ "another_tag_2", "Another sub category title", "another descriptive sentence"]
# ])

PublicBodyCategories.add(:en, [
    "Government",
        [ "ministry", "Ministries", "Ministries"],
        [ "minister", "Ministers", "Ministers"],
    "Councils",
        [ "city_council", "City Council", "City Council"],
        [ "district_council", "District Council", "District Council"],
    "Health Boards",
        [ "dhb", "District Health Board", "District Health Board"],
    "Schools",
        [ "contributing_school", "Contributing schools", "Primary schools" ],
        [ "primary_school", "Primary schools", "Primary schools" ],
        [ "secondary_school", "Secondary schools", "Secondary schools"],
        [ "composite_school", "Composite schools", "Composite schools"],
        [ "private_school", "Private schools", "Private schools"],
        [ "university", "University", "University"],
    "Popular agencies",
        [ "popular_agency", "Popular agencies", "Popular agencies"]
])
