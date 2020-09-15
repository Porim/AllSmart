# [allSmart.uk](https://www.allsmart.uk)

[allSmart](https://www.allsmart.uk) is a demo project that believes 
> **everybody** is **smart** with the right education

[allSmart](https://www.allsmart.uk) is made for parents to create learning experience specifically for their child and to have full control over entertaining learning experience through educational games.

## Currently in progress

* Refactoring the code and fixing all the bags ([GitHub Project](https://github.com/Porim/AllSmart/projects/2))

## Next to do

* Adding full responsiveness

---

## Steps of Development

1. User stories in Excel

2. Prototyping in Figma

3. DB Schema in Wagon's environment

    ![DB Schema][1]

    [1]: https://res.cloudinary.com/mirodev/image/upload/v1600146436/dbSchema2_r4ybos.jpg
    "DB Schema"

4. Generating rails app with a template that includes Devise
    
    ```
    rails new \
      --database postgresql \
      --webpack \
      -m https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb \  
      AllSmart
    ```

5. Setting up [GitHub](https://github.com/Porim/AllSmart) and spliting tasks in [Projects](https://github.com/Porim/AllSmart/projects)

6. Setting up Heroku with [custom domain](https://www.allsmart.uk) and SSL 

7. Routes

    ```
    Rails.application.routes.draw do
      devise_for :users, :controllers => { :registrations => :registrations }
      get "/profile/:user_id", to: "users#profile", as: :profile
      root to: 'pages#home'
      get "/kids/:id/profile", to: "kids#profile", as: :kids_profile
      resources :games, only: [:index, :show]
      resources :kids, only: [:show, :create, :edit, :update, :new] do
        resources :allowed_games, only: [:create]
        get "/update_score", to: "kids#update_score"
        get "/update_level", to: "kids#update_level"
      end
      resources :allowed_games, only: [:destroy]
    end
    ```

8. Models

    * allowed_game
    * application_record
    * game
    * kid
    * user

9. Controllers

    * allowed_games
    * application
    * games
    * kids
    * pages
    * registrations
    * users

10. Views

    * devise
    * games
    * kids
    * layouts
    * pages
    * shared
    * users

<!-- 11. MVC pattern -->

<!-- 12. Organising CSS files -->

---

### Developed at

[Le Wagon](https://www.lewagon.com/) batch #423 in **nine** days (24/8/2020 - 3/9/2020).\
Then further improved over next weeks after the end of the Bootcamp.

### Developed By

Nikita V Visenko, Miroslav Palka, Dobrin Nedyalkov and Taoreed Lawal\
Project managers: Rodrigo Ruas and Rahul Keerthi\
Other contributors: Anne De Joly

### Technologies used
* Ruby
* Ruby on Rails
* HTML 5
* CSS 3
* Bootstrap 4
* Javascript ES6
* PostgreSQL
* GitHub
* Heroku
* VSC/Sublime
