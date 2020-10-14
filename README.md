# Sizabl.io

> System Design Capstone

## Related Projects

 - https://github.com/Sizabl-io/calendar-reservations
 - https://github.com/Sizabl-io/review-service
 - https://github.com/Sizabl-io/Photo-Gallery-Service
 - https://github.com/Sizabl-io/people-also-viewed

## Table of Contents

1. [Usage](#Usage)
1. [Requirements](#requirements)
1. [Development](#development)

## Usage

> Some usage instructions

## Requirements

An `nvmrc` file is included if using [nvm](https://github.com/creationix/nvm).

- Node 6.13.0
- etc

## Development

### Installing Dependencies

From within the root directory:

```sh
npm install -g webpack
npm install
```
## Server API

### CREATE - Add restaurant
  * POST `/api/alsoViewedRestaurants`

**Success Status Code:** `201`

**Request Body**: Expects JSON with the following keys.

```json
    {
    "id": "Number",
    "name": "String",
    "rating": "Number",
    "num_of_reviews": "Number",
    "how_pricey": "Number",
    "cuisine_categories": "Array",
    "display_img_url": "String",
    "heart": "Boolean",
    "super_rated": "Boolean",
    "modal_images": "Array",
    "review_modal": "Array"
    }
```

### READ - Get restaurant info
  * GET `/api/alsoViewedRestaurants/:id`

**Path Parameters:**
  * `id` restaurant id

**Success Status Code:** `200`

**Returns:** JSON

```json
    {
    "id": "Number",
    "name": "String",
    "rating": "Number",
    "num_of_reviews": "Number",
    "how_pricey": "Number",
    "cuisine_categories": "Array",
    "display_img_url": "String",
    "heart": "Boolean",
    "super_rated": "Boolean",
    "modal_images": "Array",
    "review_modal": "Array"
    }
```

### UPDATE - Update restaurant rating
  * PATCH `/api/alsoViewdRestaurants/:id`

**Path Parameters:**
  * `id` restaurant id

**Success Status Code:** `204`

**Request Body**: Expects JSON with any of the following key

```json
    {
    "rating": "Number",
    }
```

### DELETE - Delete restaurant
  * DELETE `/api/alsoViewedRestaurants/:id`

**Path Parameters:**
  * `id` restaurant id

**Success Status Code:** `204`

