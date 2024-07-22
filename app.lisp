(uiop:define-package #:hover/app
  (:use #:cl #:reblocks-file-server)
  (:import-from #:reblocks/widget
                #:widget
                #:update
                #:render
                #:defwidget)
  (:import-from #:reblocks)
  (:import-from #:reblocks/server)
  (:import-from #:reblocks/app
                #:defapp)
  (:import-from #:reblocks/session
                #:init)
  (:import-from #:reblocks-ui
                #:ui-widget)
  (:import-from #:reblocks/dependencies
                #:get-dependencies)
  (:import-from #:reblocks-lass
                #:make-dependency))
(in-package #:hover/app)

			   
(defwidget wrapper ()
  ((items  :initarg :wrapper
		   :accessor wrapper)))


(defapp app
  :prefix "/")  


(defparameter *images* (make-instance 'wrapper
				      :wrapper nil))
									
(defmethod reblocks/page:init-page ((app app) url-path expire-at)
	(declare (ignorable app url-path expire-at))
		*images*)


(defmethod render ((wrapper wrapper))
  (reblocks/html:with-html
    (:div :class "items"
	  (:div :class "item"
		:style "background-image: url(img/photos/1.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/2.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/3.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/4.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/5.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/6.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/7.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/8.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/9.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/10.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/11.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/12.jpg)"
		:tabindex "1")
	  (:div :class "item"
		:style "background-image: url(img/photos/13.jpg)"
		:tabindex "1"))))


(defmethod reblocks/dependencies:get-dependencies ((app app))
  (list* (reblocks/dependencies:make-dependency "css/main.css"
                                                :system :hover)		 
         (call-next-method)))
		 
		 

(defmethod initialize-instance ((app app) &rest args)
  (declare (ignorable args))
  (reblocks-file-server:make-route :root (asdf:system-relative-pathname "hover" "img/photos/")
                                   :uri "/img/photos/")
  (call-next-method))

;; (defmethod get-dependencies ((widget page))
;;   (list
;;    (make-dependency
;;      '(.page
;;        :width 60%
;;        :margin 3rem auto 3rem auto) )))


;; (defmethod get-dependencies ((widget multi-pages))
;;   (list
;;    (make-dependency
;;      '(.multi-pages
;;        :display flex
;;        :lex-direction row
;;        :gap 3rem
;;        :margin-left 3rem
;;        :margin-right 3rem) )))



(defun start ()
  (reblocks/server:start :port 40000
                         :apps (list 'app))
  (log:config :info))
  
(defun stop ()
	(reblocks/server:stop))
