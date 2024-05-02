(function ($, Drupal)  {
  'use strict';

  /**
   * Attach the countUp.js and Scrollama behaviours to the expected elements.
   *
   * @type {Drupal~behavior}
   */
  Drupal.behaviors.countup = {

    /**
     * The scrollama object.
     *
     * @var object
     */
    scroller: null,

    /**
     * The selector to be used for CountUp targets.
     *
     * @var string
     */
    stepSelector: '.countup',

    /**
     * Defines the correspondence between configurable Drupal settings and the CountUp.js expected options.
     *
     * @var object
     */
    mapping: {
      useEasing: 'easing',
      useGrouping: 'grouping',
      separator: 'separator',
      prefix: 'prefix',
      suffix: 'suffix',
      decimal: 'type_decimal',
    },

    /**
     * {@inheritDoc}
     */
    attach: function(context) {
      this.initScroller();
    },

    /**
     * Initialize the Scrollama instance.
     */
    initScroller: function() {
      var o = this;

      if (!o.scroller) {
        // Do not waste time if there are no targets.
        if (!$(o.stepSelector).length) {
          return;
        }

        if (typeof scrollama === "function") {
          o.scroller = new scrollama();
          o.scroller
            .setup({
              step: o.stepSelector,
              offset: 1,
              once: true,
              debug: false,
            })
            .onStepEnter($.proxy(o.countup, o));

          //Update scrollama for scroll triggers with new dimensions.
          $(window).resize(function () {
            o.scroller.resize();
          });
        }
      }
    },

    /**
     * Performs the countUp action.
     *
     * @param response
     */
    countup: function(response) {
      var o = this;
      var element = $(response.element);
      var settings = $.extend({ start: 0, duration: 2.5, decimals: 0}, element.data());
      var options = {};

      if (typeof settings['end'] === "undefined") {
        if ($.isNumeric(element.html())) {
          settings['end'] = element.html();
        }
        else {
          // Nothing valid is defined for the "end" value, exit here...
          return;
        }
      }

      $.each(o.mapping, function(option, setting) {
        if (settings[setting]) {
          options[option] = settings[setting];
        }
      });

      // Instanciate the plugin.
      var count = new CountUp(element[0], settings['start'], settings['end'], settings['decimals'], settings['duration'], options);
      if (!count.error) {
        count.start();
      }
      else if (window.console) {
        window.console.error(count.error);
      }
    }

  };

})(jQuery, Drupal);
