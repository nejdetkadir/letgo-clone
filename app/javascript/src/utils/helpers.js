// usage handleFormData("product", [{"name": "nejdet"}, {"age": 25}])
const handleFormData = (resource, arr, imageArrKey=null) => {
  let formData = new FormData();
  arr.forEach(obj => {
    if (imageArrKey != null && Object.entries(obj)[0][0] == imageArrKey) {
      Object.entries(obj)[0][1].forEach(image => {
        formData.append(`${resource}[${imageArrKey}][]`, image);
      });
    } else {
      formData.append(`${resource}[${Object.entries(obj)[0][0]}]`, Object.entries(obj)[0][1]);
    }
  });
  return formData;
};

module.exports = {handleFormData};
