$.lazybox("<%= j(render partial: params[:page]) %>")
dataLayer.push { 'event': '<%= params[:page] %>' }
