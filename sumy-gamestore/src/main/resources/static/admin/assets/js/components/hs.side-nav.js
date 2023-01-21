/**
 * Side Nav wrapper.
 *
 * @author Htmlstream
 * @version 1.0
 * @requires
 *
 */

var isSideMenuMini = $.cookie('isSideMenuMini') ? true : '',
  shouldOpenSidebarOnHover = false;

;
(function ($) {
  'use strict';

  $.HSCore.components.HSSideNav = {
    /**
     *
     *
     * @var Object _baseConfig
     */
    _baseConfig: {
      afterOpen: function () {
      },
      afterClose: function () {
      }
    },

    /**
     *
     *
     * @var jQuery pageCollection
     */
    pageCollection: $(),

    /**
     * Initialization of Side Nav wrapper.
     *
     * @param String selector (optional)
     * @param Object config (optional)
     *
     * @return jQuery pageCollection - collection of initialized items.
     */
    init: function (selector, config) {
      this.collection = selector && $(selector).length ? $(selector) : $();
      if (!$(selector).length) return;

      this.config = config && $.isPlainObject(config) ?
        $.extend({}, this._baseConfig, config) : this._baseConfig;

      this.config.itemSelector = selector;

      this.initSideNav();

      return this.pageCollection;
    },

    initSideNav: function () {
      //Variables
      var $self = this,
        config = $self.config,
        collection = $self.pageCollection;

      //Actions
      this.collection.each(function (i, el) {
        //Variables
        var $this = $(el),
          target = $this.data('hssm-target'),
          targetClass = $this.data('hssm-class'),
          bodyClass = $this.data('hssm-body-class'),
          isUnifyEffect = Boolean($this.data('hssm-fade-effect')),
          isShowAllExceptThis = Boolean($this.data('hssm-is-close-all-except-this')),
          $closedItems = [[], []],
          newClosedItems,
          windW = $(window).width();

        $(target).find('[data-hssm-target]').each(function () {

          if ($(this).parent().hasClass('u-side-nav--top-level-menu-item u-side-nav-opened')) {

            $closedItems[0].push($(this).data('hssm-target'));

          }

        });

        $this.on('click', function (e) {
          e.preventDefault();

          newClosedItems = $closedItems[0].concat($closedItems[1]);

          if (!$(target).hasClass('toggled')) {
            $self.defaultOpenEffect(target, newClosedItems, targetClass, bodyClass, config.afterOpen);
            $.cookie('isSideMenuMini', true);

            shouldOpenSidebarOnHover = true;
          } else {
            $self.defaultCloseEffect(target, newClosedItems, targetClass, bodyClass, config.afterClose);
            $.cookie('isSideMenuMini', '');

            shouldOpenSidebarOnHover = false;
          }
        });

        if ($('body').hasClass('has-fixed-sidebar')) {
          $(target).on('mouseenter', function (e) {
            e.preventDefault();
            if (shouldOpenSidebarOnHover) {
              $self.defaultCloseEffect(target, newClosedItems, targetClass, bodyClass, config.afterClose);
            }
          });
          $(target).on('mouseleave', function (e) {
            e.preventDefault();
            if (shouldOpenSidebarOnHover) {
              $self.defaultOpenEffect(target, newClosedItems, targetClass, bodyClass, config.afterOpen);
            }
          });
        }

        $(target).find('[data-hssm-target]').on('click', function (e) {
          e.preventDefault();

          var itemTarget = $(this).data('hssm-target'),
            $itemParent = $(this).parent();

          if (isShowAllExceptThis) {

            if (!$('body').hasClass('u-side-nav-mini')) {

              $itemParent.parent().find('> li:not(".has-active") > ul:not("' + itemTarget + '")').slideUp(400, function () {

                $(this).parent().removeClass('u-side-nav-opened');

              });

            } else {

              $itemParent.parent().find('> li > ul:not("' + itemTarget + '")').slideUp(400, function () {

                $(this).parent().removeClass('u-side-nav-opened');

                $closedItems[1].push(itemTarget);

              });

            }

            $(itemTarget).slideToggle(400, function () {

              if ($(itemTarget).is(':visible')) {

                $closedItems[1] = itemTarget;

              } else {

                $closedItems[1] = [];

              }

              $(this).parent().toggleClass('u-side-nav-opened');

            });

          } else {

            if (!$(this).parent().hasClass('u-side-nav-opened')) {

              $closedItems[1].push(itemTarget);

            } else {

              $closedItems[1] = $.grep($closedItems[1], function (value) {

                return value != itemTarget;

              });

            }

            $(itemTarget).slideToggle(400, function () {

              if ($(itemTarget).is(':visible')) {

                $closedItems[1].push(itemTarget);

              } else {

                $self.removeElFromArray($closedItems[1], itemTarget);

              }

              $(this).parent().toggleClass('u-side-nav-opened');

            });
          }

        });

        if (windW <= 992 || isSideMenuMini == true) {

          $(this).trigger('click');

        }

        $(window).on('resize', function () {
          var windW = $(window).width();

          if (windW <= 992) {
            $this.removeClass('once-opened');

            if (!$this.hasClass('is-active')) {
              if (!$this.hasClass('once-closed')) {
                $this.addClass('is-active was-opened once-closed');

                if (isUnifyEffect) {
                  $self.unifyOpenEffect(target, targetClass, bodyClass);
                } else {
                  newClosedItems = $closedItems[0].concat($closedItems[1]);
                  
                  $self.defaultOpenEffect(target, newClosedItems, targetClass, bodyClass, config.afterOpen);
                }
              }
            }
          } else {
            $this.removeClass('once-closed');

            if ($this.hasClass('was-opened')) {
              $this.removeClass('is-active was-opened');

              if (!$this.hasClass('once-opened')) {
                $this.addClass('once-opened');

                if (isUnifyEffect) {
                  $self.unifyCloseEffect(target, targetClass, bodyClass);
                } else {
                  $self.defaultCloseEffect(target, newClosedItems, targetClass, bodyClass, config.afterClose);
                }
              }
            }
          }
        });

        //Actions
        collection = collection.add($this);
      });
    },

    defaultOpenEffect: function (target, closeditems, targetclass, bodyclass, funcs) {
      $(target).addClass('toggled u-side-nav--mini-hover-on');

      if (closeditems.length > 0) {
        var items = closeditems.toString();

        $(items).slideUp(400, function () {
          $(target + '.toggled').addClass(targetclass);
          $('body').addClass(bodyclass);
          $(items).parent().removeClass('u-side-nav-opened');
          funcs();
        });
      } else {
        $(target + '.toggled').addClass(targetclass);
        $('body').addClass(bodyclass);
        funcs();
      }
    },

    defaultCloseEffect: function (target, closeditems, targetclass, bodyclass, funcs) {
      $(target).removeClass('toggled u-side-nav--mini-hover-on');
      $(target).removeClass(targetclass + ' toggled');
      $('body').removeClass(bodyclass);

      if (closeditems.length > 0) {
        setTimeout(function () {
          $(closeditems.toString()).parent().addClass('u-side-nav-opened');
          $(closeditems.toString()).slideDown(400);
          funcs();
        }, 300);
      }
    },

    removeElFromArray: function (arr) {

      var what,
        a = arguments,
        L = a.length,
        ax;

      while (L > 1 && arr.length) {

        what = a[--L];

        while ((ax = arr.indexOf(what)) !== -1) {

          arr.splice(ax, 1);

        }

      }

      return arr;

    }
  }

})(jQuery);
