Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # list all the tasks
  get "tasks", to: "tasks#index"

  # create a new task
  get "tasks/new", to: "tasks#new", as: :new_task # The `new` route needs to be *before* `show` route.
  post "tasks", to: "tasks#create"

  # list one task
  # NB: The `show` route needs to be *after* `new` route.
  get "tasks/:id", to: "tasks#show", as: :task

  # Edit/update a task
  get "tasks/:id/edit", to: "tasks#edit" , as: :edit_task
  patch "tasks/:id", to: "tasks#update"

  # Delete a task
  delete "tasks/:id", to: "tasks#destroy"
end
