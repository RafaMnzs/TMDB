//
//  Strings.swift
//  TMDB
//
//  Created by Rafael Menezes on 28/04/26.
//

import Foundation

enum Strings {

    enum TabBar {
        enum Movies {
            static var title: String {
                String(localized: "TabBar.Movies.title.text")
            }
        }

        enum Favorite {
            static var title: String {
                String(localized: "TabBar.Favorite.title.text")
            }
        }
    }

    enum SearchView {
        static var title: String {
            String(localized: "SearchView.title.text")
        }

        enum SearchBar {
            static var placeholder: String {
                String(localized: "SearchBar.placeholder.text")
            }

            enum Button {
                static var title: String {
                    String(localized: "SearchBar.Button.title.text")
                }
            }
        }
    }

    enum ListFilmsView {
        static var title: String {
            String(localized: "ListFilmsView.title.text")
        }
    }

    enum SavedMoviesView {
        static var title: String {
            String(localized: "SavedMoviesView.title.text")
        }
    }

    enum DetailFilmView {
        static var originalTitle: String {
            String(localized: "DetailFilmView.originalTitle.text")
        }

        static var resume: String {
            String(localized: "DetailFilmView.resume.text")
        }

        static var release: String {
            String(localized: "DetailFilmView.release.text")
        }

        static var cost: String {
            String(localized: "DetailFilmView.cost.text")
        }

        static var revenue: String {
            String(localized: "DetailFilmView.revenue.text")
        }

        static var voteAverage: String {
            String(localized: "DetailFilmView.voteAverage.text")
        }
    }

}
