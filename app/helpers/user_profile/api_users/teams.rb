# encoding: utf-8

#  Copyright (c) 2008-2017, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

module UserProfile
  module ApiUsers
    class Teams

      include ActionView::Helpers::OutputSafetyHelper
      include ActionView::Helpers::TagHelper
      include ActionView::Context
      include Rails.application.routes.url_helpers
      include ActionView::Helpers::UrlHelper

      def initialize(api_user)
        @api_user = api_user
        @teams = api_user.teams
      end

      def render
        content_tag(:div) do
          content = team_links
          safe_join(content)
        end
      end

      private

      def team_ids
        @teams.pluck(:id).join(', ')
      end

      def team_names
        @teams.pluck(:name).join(', ')
      end

      def team_links
        content = []
        @teams.each do |team|
          path = team_groups_path(team_id: team)
          content += [content_tag(:div) do
            link_to(team.name, path)
          end]
        end
        content
      end
    end
  end
end
