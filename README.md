# [allSmart.uk](https://www.allsmart.uk)
[allSmart](https://www.allsmart.uk) is a demo project that believes
> **everybody** is **smart** with the right education
[allSmart](https://www.allsmart.uk) enables parents to create learning experience specifically tailored to their children and allows full parental control over gamefied learning. Current features include:
* Creating an account
* Creating multiple profiles for children
* Filtering, adding and deleting games which given child is allowed to play
* Access to child mode - page where children can play games without having access to other parts of the web app
* One fully working game
* Attractive front-end, with dynamic elements powered by Javascript ES6 and [AOS package](https://michalsnik.github.io/aos/)
## Currently in progress
Refactoring the code and bug-fixing ([GitHub Project](https://github.com/Porim/AllSmart/projects/2))

During the last 9 very intensive days [@Le Wagon bootcamp](https://www.lewagon.com/london) we had a project sprint, with the very strong push to finalise the front-end. As a result, we managed to achieve appealing design, however internals of the code were not completely optimal. As a part of refactoring process, we are currently addressing the following issues:
* Fixing N+1 queries
* Adding comments to views, controllers and JS files
* Making code more readable by creating partials and absracting relevant code from views to controllers
* Reviewing routing
* Improving organisation of CSS files. During the bootcamp we followed atomic principles by designing re-usable components, however some of the CSS code is duplicated, and some was never used.
* Refactoring our own UI component library by creating modifier classes, which would allow the same component to be used on every page with additional styling provided by modifer classes (a-la Bootstrap)
* Focusing on UX, by improving UI design
## Next on the agenda
* Adding full responsiveness
* Adding additional features
---
## Steps of Development following MVC pattern
1. User stories in Google Sheets
2. Prototyping in Figma
3. DB Schema in Wagon's environment
    ![DB Schema][1]
    
    [1]: https://res.cloudinary.com/mirodev/image/upload/v1600146436/dbSchema2_r4ybos.jpg
    "DB Schema"
4. Generating rails app and and configuring Devise for user authentication
5. Setting up [GitHub](https://github.com/Porim/AllSmart) and spliting tasks in [Projects](https://github.com/Porim/AllSmart/projects)
6. Setting up Heroku with [custom domain](https://www.allsmart.uk) and SSL
7. Creating resourceful routes
    ```
    Rails.application.routes.draw do
      devise_for :users
      get "/profile/:user_id", to: "users#profile", as: :profile
      root to: 'pages#home'
      resources :games, only: [:index, :show]
      resources :kids, only: [:show, :create, :edit, :update, :new, :profile] do
        get "/profile", to: "kids#profile"
        resources :allowed_games, only: [:create]
          get "/update_score", to: "kids#update_score"
          get "/update_level", to: "kids#update_level"
        end
      resources :allowed_games, only: [:destroy]
    end
    ```
8. Creating models and validations, corresponding views and controllers following Rails conventions.    
11. Organising CSS files (currently being refactored)
    During bootcamp we used atomic framework when writing CSS, however after the project week was finished, we found that some further refactoring is neccessary. Our current way of organising CSS:
    ```
    stylesheets
      components
      config
        _bootstrap_variables.scss
        _colors.scss
        _fonts.scss
      pages
    ```
    Pages folder contains CSS applied to mark-up structure of the page. Components folder contains CSS applied to individual components, as well as modifier clases. All CSS files are internally split in IDs and Classes sections, and class/id names are organised alphabetically within each section.
---
### Developed at
[Le Wagon](https://www.lewagon.com/) batch #423 in **nine** days (24/8/2020 - 3/9/2020).\
Then further improved over next weeks after the end of the Bootcamp.
### Developed By
[Nikita V Visenko](https://www.linkedin.com/in/nikita-visencuk-visenko-74b47b127/), [Miroslav Palka](https://www.linkedin.com/in/mirodev/), [Dobrin Nedyalkov](https://www.linkedin.com/in/dobrin-nedyalkov/) and [Taoreed Lawal](https://www.linkedin.com/in/taoreed-olugbenga-lawal-71952bb0/)\
Project managers during bootcamp: [Rodrigo Ruas](https://www.linkedin.com/in/rodrigoruas/) and [Rahul Keerthi](https://www.linkedin.com/in/rahulkeerthi/)\
Other contributors: [Anne De Joly](https://www.linkedin.com/in/annedejoly/)
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
