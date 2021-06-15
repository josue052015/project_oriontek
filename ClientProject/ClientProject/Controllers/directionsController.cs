using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ClientProject;

namespace ClientProject.Controllers
{
    public class directionsController : Controller
    {
        private project_oriontekEntities db = new project_oriontekEntities();

      
        public ActionResult Index()
        {
            var directions = db.directions.Include(d => d.client);
            return View(directions.ToList());
        }

       
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            directions directions = db.directions.Find(id);
            if (directions == null)
            {
                return HttpNotFound();
            }
            return View(directions);
        }

       
        public ActionResult Create()
        {
            ViewBag.Id_client = new SelectList(db.client, "Id", "Name");
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,direction,Id_client")] directions directions)
        {
            if (ModelState.IsValid)
            {
                db.directions.Add(directions);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_client = new SelectList(db.client, "Id", "Name", directions.Id_client);
            return View(directions);
        }

      
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            directions directions = db.directions.Find(id);
            if (directions == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_client = new SelectList(db.client, "Id", "Name", directions.Id_client);
            return View(directions);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,direction,Id_client")] directions directions)
        {
            if (ModelState.IsValid)
            {
                db.Entry(directions).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_client = new SelectList(db.client, "Id", "Name", directions.Id_client);
            return View(directions);
        }

        
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            directions directions = db.directions.Find(id);
            if (directions == null)
            {
                return HttpNotFound();
            }
            return View(directions);
        }

      
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            directions directions = db.directions.Find(id);
            db.directions.Remove(directions);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
