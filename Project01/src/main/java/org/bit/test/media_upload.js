/*!
 * froala_editor v1.2.8 (https://www.froala.com/wysiwyg-editor)
 * License https://www.froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */
! function(a) {
    a.Editable.DEFAULTS = a.extend(a.Editable.DEFAULTS, {
        mediaManager: !0,
        imagesLoadURL: "c://TestFileSave//",
        imagesLoadParams: {}
    
    }), a.Editable.prototype.showMediaManager = function() {
    	
        this.$image_modal.show(), this.$overlay.show(), this.loadImages(), this.$document.find("body").css("overflow", "hidden")
        
    }, a.Editable.prototype.hideMediaManager = function() {
    	
        this.$image_modal.hide(), this.$overlay.hide(), this.$document.find("body").css("overflow", "")
        
    }, a.Editable.prototype.mediaModalHTML = function() {
    	
        var a = '<div class="froala-modal"><div class="f-modal-wrapper"><h4><span data-text="true">Manage images</span><i title="Cancel" class="fa fa-times" id="f-modal-close-' + this._id + '"></i></h4>';
        return a += '<img class="f-preloader" id="f-preloader-' + this._id + '" alt="Loading..." src="' + this.options.preloaderSrc + '" style="display: none;">', a += WYSIWYGModernizr.touch ? '<div class="f-image-list f-touch" id="f-image-list-' + this._id + '"></div>' : '<div class="f-image-list" id="f-image-list-' + this._id + '"></div>', a += "</div></div>"
    }, a.Editable.prototype.buildMediaManager = function() {
    	
        this.$image_modal = a(this.mediaModalHTML()).appendTo("body"), this.$preloader = this.$image_modal.find("#f-preloader-" + this._id), this.$media_images = this.$image_modal.find("#f-image-list-" + this._id), this.$overlay = a('<div class="froala-overlay">').appendTo("body"), this.$overlay.on("mouseup", a.proxy(function(a) {
            this.isResizing() || a.stopPropagation()
        }, this)), this.$image_modal.on("mouseup", a.proxy(function(a) {
            this.isResizing() || a.stopPropagation()
        }, this)), this.$image_modal.find("i#f-modal-close-" + this._id).click(a.proxy(function() {
            this.hideMediaManager()
        }, this)), this.$media_images.on(this.mouseup, "img", a.proxy(function(b) {
            b.stopPropagation();
            var c = b.currentTarget;
            this.writeImage(a(c).attr("src")), this.hideMediaManager()
            
        }, this)), this.$media_images.on(this.mouseup, ".f-delete-img", a.proxy(function(b) {
            b.stopPropagation();
            var c = a(b.currentTarget).prev(),
                d = "Are you sure? Image will be deleted.";
            a.Editable.LANGS[this.options.language] && (d = a.Editable.LANGS[this.options.language].translation[d]), confirm(d) && this.triggerEvent("beforeDeleteImage", [a(c)], !1) !== !1 && (a(c).parent().addClass("f-img-deleting"), this.deleteImage(a(c)))
        }, this)), this.options.mediaManager && (this.$image_wrapper.on("click", "#f-browser-" + this._id, a.proxy(function() {
            this.showMediaManager()
        }, this)).on("click", "#f-browser-" + this._id + " i", a.proxy(function() {
            this.showMediaManager()
        }, this)), this.$image_wrapper.find("#f-browser-" + this._id).show()), this.hideMediaManager()
    }, a.Editable.prototype.destroyMediaManager = function() {
        this.hideMediaManager(), this.$overlay.html("").removeData().remove(), this.$image_modal.html("").removeData().remove()
    }, a.Editable.prototype.initMediaManager = function() {
        return this.options.mediaManager ? (this.buildMediaManager(), void this.addListener("destroy", this.destroyMediaManager)) : !1
    }, a.Editable.initializers.push(a.Editable.prototype.initMediaManager), a.Editable.prototype.processLoadedImages = function(a) {
        try {
            if (a.error) this.throwImagesLoadErrorWithMessage(a.error);
            else {
                this.$media_images.empty();
                for (var b = 0; b < a.length; b++) a[b].src ? this.loadImage(a[b].src, a[b].info) : this.loadImage(a[b])
            }
        } catch (c) {
            this.throwLoadImagesError(4)
        }
    }, a.Editable.prototype.throwImagesLoadErrorWithMessage = function(a) {
        this.triggerEvent("imagesLoadError", [{
            message: a,
            code: 0
        }], !1), this.hideImageLoader()
    }, a.Editable.prototype.loadImages = function() {
        this.$preloader.show(), this.$media_images.empty(), this.options.imagesLoadURL ? (a.support.cors = !0, a.getJSON(this.options.imagesLoadURL, this.options.imagesLoadParams, a.proxy(function(a) {
            this.triggerEvent("imagesLoaded", [a], !1), this.processLoadedImages(a), this.$preloader.hide()
        }, this)).fail(a.proxy(function() {
            this.throwLoadImagesError(2)
        }, this))) : this.throwLoadImagesError(3)
    }, a.Editable.prototype.throwLoadImagesError = function(a) {
        void 0 === a && (a = -1);
        var b = "Unknown image upload error.";
        1 == a ? b = "Bad link." : 2 == a ? b = "Error during request." : 3 == a ? b = "Missing imagesLoadURL option." : 4 == a && (b = "Parsing response failed."), this.triggerEvent("imagesLoadError", [{
            code: a,
            message: b
        }], !1), this.$preloader.hide()
    }, a.Editable.prototype.loadImage = function(b, c) {
        var d = new Image,
            e = a("<div>").addClass("f-empty");
        d.onload = a.proxy(function() {
            var d = "Delete";
            a.Editable.LANGS[this.options.language] && (d = a.Editable.LANGS[this.options.language].translation[d]);
            var f = a('<img src="' + b + '"/>');
            for (var g in c) f.attr("data-" + g, c[g]);
            e.append(f).append('<a class="f-delete-img"><span data-text="true">' + d + "</span></a>"), e.removeClass("f-empty"), this.$media_images.hide(), this.$media_images.show(), this.triggerEvent("imageLoaded", [b], !1)
        }, this), d.onerror = a.proxy(function() {
            e.remove(), this.throwLoadImagesError(1)
        }, this), d.src = b, this.$media_images.append(e)
    }
}(jQuery);