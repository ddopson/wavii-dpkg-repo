
module PackagerDSL

  def name(str)
    class_eval %{
      def name
        %Q{#{str}}
      end
    }
  end


  def description(str)
    eval %{
      def description
        %Q{#{str}}
      end
    }
  end
end

self.extend PackagerDSL
