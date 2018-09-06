Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/todos'              => 'todos#index'
  get    '/todos/list'         => 'todos#list'
  get    '/todos/new'
  post   '/todos'              => 'todos#create'
  get    '/todos/:id'          => 'todos#show', as: 'todo'
  get    '/todos/:id/edit'     => 'todos#edit', as: 'edit_todo'
  patch  '/todos/:id'          => 'todos#update'
  delete '/todos/:id'          => 'todos#destroy'
  get    '/todos/:id/complete' => 'todos#complete', as: 'complete_todo'
end
