<?php
/**
 * This file is part of the Behat popup extension.
 * (c) 2013 Vadim Kusakin <vadim.irbis@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace BehatPopupExtension;

/**
 * Popup handling interface for driver
 *
 */
interface PopupHandlingInterface
{
    /**
     * Returns text of opened popup
     *
     */
    public function getPopupText();

    /**
     * Fills in text into popup
     *
     * @param string $text
     */
    public function setPopupText($text);

    /**
     * Accept opened popup
     *
     */
    public function acceptPopup();

    /**
     * Dismisses opened popup
     *
     */
    public function dismissPopup();
}

