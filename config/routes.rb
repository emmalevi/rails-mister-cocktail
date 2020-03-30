Rails.application.routes.draw do
  get    "cocktails",          to: "cocktails#index"

  get    "cocktails/new",      to: "cocktails#new",  as: :new_cocktail
  post   "cocktails",          to: "cocktails#create"

  # NB: The `show` route needs to be *after* `new` route.
  get    "cocktails/:id",      to: "cocktails#show", as: :cocktail

  get    "cocktails/:id/edit", to: "cocktails#edit", as: :edit_cocktail
  patch  "cocktails/:id",      to: "cocktails#update"

  delete "cocktails/:id",      to: "cocktails#destroy"
end
