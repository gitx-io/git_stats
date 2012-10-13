require 'git_stats/hash_initializable'

module GitStats
  module GitData
    class Author
      include HashInitializable

      attr_reader :repo, :name, :email

      def commits
        @commits ||= repo.commits.select { |hash, commit| commit.author == self }
      end

      def activity
        @activity ||= Activity.new(commits)
      end

    end
  end
end