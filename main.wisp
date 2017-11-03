(def things [])

(defn add-thing []
  (.push things (Math.random)))

(defn view-thing-list []
  (.map things (fn [e i] (m :div e))))

(defn view []
  [(m :header
      (m :div {:class "mui-appbar mui--appbar-line-height mui--text-right"}
         (m :span {:class "mui--text-justify" :style "margin-right: 1em;"} (m :a {:href "https://github.com/chr15m/speedy-spa"} "source code"))))
   (m :div {:class "mui-container"}
      (m :div {:class "mui-panel"}
         [(m :div {:class "mui--text-right"}
             (m :button {:onclick add-thing
                         :class "mui-btn mui-btn--large mui-btn--primary mui-btn--fab mui--text-display2"}
                "+"))
          (if (.-length things)
            (m :div
               [(m :span "Random numbers:")
                (view-thing-list)])
            (m :span "No numbers yet."))]))])

(m.mount (document.getElementById "app") {"view" view})
