import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageLeave } from './manage-leave';

describe('ManageLeave', () => {
  let component: ManageLeave;
  let fixture: ComponentFixture<ManageLeave>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ManageLeave]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageLeave);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
